/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct UIRelativeContainerCollaboration009 {
  build() {
    Row() {
      RelativeContainer() {
        Row() {
          Text('row1')
        }
        .justifyContent(FlexAlign.Center)
        .width('13.89%')
        .height('8.2%')
        .backgroundColor('#a3cf62')
        .id('row1')

        Row() {
          Text('row2')
        }
        .justifyContent(FlexAlign.Center)
        .width('13.89%')
        .height('8.2%')
        .backgroundColor('#00ae9d')
        .alignRules({
          middle: { anchor: 'row1', align: HorizontalAlign.End },
          top: { anchor: 'row1', align: VerticalAlign.Bottom }
        })
        .id('row2')

        Row() {
          Text('row3')
        }
        .justifyContent(FlexAlign.Center)
        .width('13.89%')
        .height('8.2%')
        .backgroundColor('#0a59f7')
        .alignRules({
          start: { anchor: 'barrier1', align: HorizontalAlign.End },
          top: { anchor: 'row1', align: VerticalAlign.Top }
        })
        .id('row3')

        Row() {
          Text('row4')
        }
        .justifyContent(FlexAlign.Center)
        .width('6.94%')
        .height('4.1%')
        .backgroundColor('#2ca9e0')
        .alignRules({
          start: { anchor: 'row1', align: HorizontalAlign.Start },
          top: { anchor: 'barrier2', align: VerticalAlign.Bottom }
        })
        .id('row4')
      }
      .direction(Direction.Rtl)
      .width('41.67%')
      .height('24.59%')
      .margin({ left: 50 })
      .border({ width: 2, color: '#6699FF' })
      .barrier([{ id: 'barrier1', localizedDirection: LocalizedBarrierDirection.END, referencedId: ['row1', 'row2'] },
        { id: 'barrier2', localizedDirection: LocalizedBarrierDirection.BOTTOM, referencedId: ['row1', 'row2'] }])
    }
    .height('100%')
  }
}
