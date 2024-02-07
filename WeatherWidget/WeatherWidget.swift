//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by Nasir Jama Elmi on 2024-01-26.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), temp: 5.6)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), temp: 4.5)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        let userDefaults = UserDefaults(suiteName: "group.jana22oj")
        let savedTemperature = userDefaults?.double(forKey: "currentTemp")
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
                   let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
                   let entry = SimpleEntry(date: entryDate, temp: savedTemperature ?? 0)
                   entries.append(entry)
               }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let temp: Double
}

struct MyWidgetEntryView : View {
    
    var entry: Provider.Entry
    var body: some View {
        ZStack{
            //ContainerRelativeShape()
            //.background(Image(.background))
            VStack(alignment: .leading){
                HStack {
                    
                    Text("🌡️").font(.largeTitle)
                    Text(entry.date.formatted(.dateTime.weekday())).font(.title)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(.white.opacity(0.6))
                    //Spacer()
                }
                HStack{
                   
                    Text(entry.date.formatted(.dateTime.day()))
                        .foregroundColor(.white.opacity(0.9))
                    Text("Temp: \(String(describing: entry.temp)) °C") .foregroundColor(.white.opacity(0.8))
                    
                }
            } .onAppear {
                print("Widget entry appeared with temperature: \(entry.temp)")
            }
            
            //.padding(2)
        }
        
    }
}


struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MyWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MyWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    WeatherWidget()
} timeline: {
    SimpleEntry(date: .now, temp: 0.5)
    SimpleEntry(date: .now, temp: 7.0)
}
