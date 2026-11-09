/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentArcListFlingSpeedLimit001 {
  private scroller: Scroller = new Scroller();
  @State flingSpeedLimit:	Optional<number> = 200;
  @State flingMessage: string = 'flingSpeedLimit值为200';

  build() {
    Column() {
      ArcList({ scroller: this.scroller }) {
        ArcListItem() {
          Row() {
            Column() {
              Text('WLAN').fontSize('38px').fontColor('#FFFFFFFF')
              Text('已开启').fontSize('20px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('蓝牙').fontSize('38px').fontColor('#FFFFFFFF')
              Text('已开启').fontSize('20px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('移动网络').fontSize('38px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('更多连接').fontSize('38px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('显示和亮度').fontSize('38px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('闹钟').fontSize('38px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('日程').fontSize('38px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('活力指标').fontSize('38px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')

        ArcListItem() {
          Row() {
            Column() {
              Text('天气').fontSize('38px').fontColor('#FFFFFFFF')
            }.width('190px')
          }
        }
        .borderRadius('65px')
        .width('414px')
        .height('129px')
        .backgroundColor('#26FFFFFF')
      }
      .scrollBar(BarState.On)
      .chainAnimation(true)
      .width('466px')
      .height('466px')
      .space(LengthMetrics.px(10))
      .borderRadius('233px')
      .backgroundColor(0xAFEEEE)
      .flingSpeedLimit(this.flingSpeedLimit)

      Column() {
        Text(this.flingMessage)
          .fontSize(30)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')


      Button('设置flingSpeedLimit为250')
        .id('250')
        .stateEffect(true)
        .onClick(() => {
          this.flingSpeedLimit = 250;
          this.flingMessage = 'flingSpeedLimit值为250';
        })
        .margin({top: 20})

      Button('设置flingSpeedLimit为300')
        .id('300')
        .stateEffect(true)
        .onClick(() => {
          this.flingSpeedLimit = -200;
          this.flingMessage = 'flingSpeedLimit值为300';
        })
        .margin({top: 20})

      Button('设置flingSpeedLimit为-200')
        .id('-200')
        .stateEffect(true)
        .onClick(() => {
          this.flingSpeedLimit = -200;
          this.flingMessage = 'flingSpeedLimit值为-200';
        })
        .margin({top: 20})

      Button('设置flingSpeedLimit为undefined')
        .id('undefined')
        .stateEffect(true)
        .onClick(() => {
          this.flingSpeedLimit = undefined;
          this.flingMessage = 'flingSpeedLimit值为undefined';
        })
        .margin({top: 20})
    }
    .justifyContent(FlexAlign.Center)

  }
}
