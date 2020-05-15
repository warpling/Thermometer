# 🌡 Thermometer
A very crude iPhone thermometer

Because I'm tired of wondering if my animations are slow or if my device is just really hot.

## The states
| | | |
|-|-|-|
| `.nominal` | 🥒 | Your phone is cooler than you are. Burn. |
| `.fair` | 🔥 | Your device is warm but performance is probably not being throttled. |
| `.serious` | 🔥🔥 | Your device is hot and performance is probably throttled. |
| `.critical` | 🔥🔥🔥 | Your device hurts to hold in places and performance is definitely being throttled. |

## Today widget
For easy temperature checking add the Today Widget (PR by @SunburstEnzo)!

## FAQ
#### Omg will you turn this into [Blackbox](https://itunes.apple.com/us/app/blackbox-think-outside-box/id962969578) challenge??
Try to imagine some of the things the average person would try to do with their device if this was a challenge… Now remember that 50% of people are stupider than that person.

#### Can you make it show an accurate temperature like [that time you turned the iPhone into a digital scale](https://medium.com/swlh/turning-the-iphone-6s-into-a-digital-scale-f2197dc2b6e7)??
I wish but it's not possible until Apple releases a warmth based equivalent for 3D Touch. 🤞

#### What's the API called?
[`ProcessInfo().thermalState`](https://developer.apple.com/documentation/foundation/processinfo/thermalstate)
