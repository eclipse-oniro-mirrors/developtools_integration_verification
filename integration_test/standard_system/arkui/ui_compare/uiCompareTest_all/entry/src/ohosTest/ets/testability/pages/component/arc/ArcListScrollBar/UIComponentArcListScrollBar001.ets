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
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute, LengthMetrics, ColorMetrics  } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentArcListScrollBar001 {
  @State barState: BarState | undefined = BarState.On;
  private scroller: Scroller = new Scroller();

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
      }
      .scrollBar(this.barState)
      .scrollBarWidth(LengthMetrics.px(10))
      .scrollBarColor(ColorMetrics.rgba(122, 0, 0))
      .width('466px')
      .height('466px')
      .space(LengthMetrics.px(10))
      .borderRadius('233px')
      .backgroundColor(0xAFEEEE)

      Button('切换滚动条状态为Off')
        .id('off')
        .stateEffect(true)
        .onClick(() => {
          this.barState = BarState.Off;
        })
        .margin({top: 20})

      Button('切换滚动条状态为Auto')
        .id('auto')
        .stateEffect(true)
        .onClick(() => {
          this.barState = BarState.Auto;
        })
        .margin({top: 20})

      Button('切换滚动条状态为undefined')
        .id('undefined')
        .stateEffect(true)
        .onClick(() => {
          this.barState = undefined;
        })
        .margin({top: 20})

      Button('切换滚动条状态为On')
        .id('on')
        .stateEffect(true)
        .onClick(() => {
          this.barState = BarState.On;
        })
        .margin({top: 20})
    }
    .justifyContent(FlexAlign.Center)

  }
}
