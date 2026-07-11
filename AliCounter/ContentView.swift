import SwiftUI

struct ContentView: View {
    @State private var points: Int = 0
    @State private var showAnimation = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color(red: 0.2, green: 0.1, blue: 0.3)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                VStack(spacing: 10) {
                    Text("عداد علي")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Ali Counter App")
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 50)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Text("النقاط الكلية")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("\(points)")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .foregroundColor(.yellow)
                        .scaleEffect(showAnimation ? 1.1 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: showAnimation)
                }
                .padding(40)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.1))
                )
                .padding(20)
                
                Spacer()
                
                Button(action: {
                    points += 1
                    showAnimation = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        showAnimation = false
                    }
                }) {
                    VStack(spacing: 12) {
                        Text("علي")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("اضغط لإضافة نقطة")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.2, green: 0.6, blue: 1.0),
                                Color(red: 0.1, green: 0.4, blue: 0.9)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(20)
                    .shadow(color: Color(red: 0.2, green: 0.6, blue: 1.0).opacity(0.5), radius: 15, x: 0, y: 8)
                }
                .scaleEffect(showAnimation ? 0.95 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: showAnimation)
                .padding(20)
                
                Button(action: {
                    points = 0
                }) {
                    Text("إعادة تعيين")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.red.opacity(0.6))
                        )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
    }
}
