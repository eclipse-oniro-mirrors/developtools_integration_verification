/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
export struct Tabs11 {
  @State text: string = '文本';
  @State barMode: BarMode = BarMode.Fixed;
  @State vertical:boolean = false;

  build() {
    Column() {
      Row() {
        Button('文本增加 ')
          .width('47%')
          .height(50)
          .onClick((event?: ClickEvent) => {
            this.text += '文本增加';
          })
          .margin({ right: '6%', bottom: '12vp' })

        Button('文本重置')
          .width('47%')
          .height(50)
          .onClick((event?: ClickEvent) => {
            this.text = '文本';
          })
          .margin({ bottom: '12vp' })
      }

      Row() {
        Button('BarMode.Fixed')
          .width('47%')
          .height(50)
          .onClick((event?: ClickEvent) => {
            this.barMode = BarMode.Fixed;
          })
          .margin({ right: '6%', bottom: '12vp' })

        Button('BarMode.Scrollable')
          .width('47%')
          .height(50)
          .onClick((event?: ClickEvent) => {
            this.barMode = BarMode.Scrollable;
          })
          .margin({ bottom: '12vp' })
      }

      Tabs({ index: 0}) {
        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Pink)
        }.tabBar(SubTabBarStyle.of(this.text))

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Green)
        }.tabBar(SubTabBarStyle.of(this.text))

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Blue)
        }.tabBar(SubTabBarStyle.of(this.text))

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Blue)
        }.tabBar(SubTabBarStyle.of(this.text))
      }
      .vertical(this.vertical)
      .height('60%')
      .backgroundColor(0xf1f3f5)
      .barMode(this.barMode)
      .barOverlap(false)
    }
    .width('100%')
    .height('100%')
    .padding('24vp')
  }
}
