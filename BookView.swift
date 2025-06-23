import SwiftUI

struct BookView: View {
    @State private var selectedDate = Date()
    @State private var showingPayment = false
    @State private var selectedTimeSlot: String? = nil
    
    private let calendar = Calendar.current
    private let timeSlots = ["10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 PM",
                             "1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM"]

    private var currentMonthDates: [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: Date()) else { return [] }
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: Date()))!
        return range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)
        }
    }

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Select a Date")
                        .font(.headline)

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(currentMonthDates, id: \.self) { date in
                            let isSelected = calendar.isDate(date, inSameDayAs: selectedDate)
                            Text(String(format: "%02d", calendar.component(.day, from: date)))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                                .clipShape(Circle())
                                .foregroundColor(isSelected ? .white : .black)
                                .onTapGesture {
                                    selectedDate = date
                                }
                        }
                    }
                    .padding()

                    Text("Available Times")
                        .font(.headline)

                    VStack {
                        ForEach(timeSlots, id: \.self) { time in
                            Button(action: {
                                selectedTimeSlot = time
                                showingPayment = true
                            }) {
                                Text(time)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }

                    Spacer()
                }
                .padding()
                .toolbar {
                      ToolbarItem(placement: .principal) {
                          
                        
                          Text("Book Session")
                              .font(.system(size: 30, weight: .bold))
                              .foregroundColor(.primary)
                      }
                  }
                  .navigationBarTitleDisplayMode(.inline)
            
                .sheet(isPresented: $showingPayment) {
                    Text("Booking for \(formatted(date: selectedDate)) at \(selectedTimeSlot ?? "")")
                }
            }
        }
    }

    private func formatted(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
}
