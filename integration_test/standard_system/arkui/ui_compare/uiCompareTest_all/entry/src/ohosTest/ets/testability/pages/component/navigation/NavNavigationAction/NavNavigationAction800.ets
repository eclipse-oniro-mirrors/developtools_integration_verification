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
export struct NavNavigationAction800 {

  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State index: number = 1
  @State subtext: string = 'subtitle'
  @State inputText: string = ''

  // 根据输入字符长度计算字体大小，字符越多字体越小
  getSubtitleFontSize(): number {
    let textLength = this.inputText.length
    if (textLength <= 5) {
      return 14
    } else if (textLength <= 10) {
      return 12
    } else if (textLength <= 20) {
      return 10
    } else {
      return 8
    }
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text('Title')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text(this.inputText.length > 0 ? this.inputText : this.subtext.repeat(this.index))
        .fontColor('#182431')
        .fontSize(this.getSubtitleFontSize())
        .lineHeight(19)
        .opacity(0.4)
        .margin({ top: 2, bottom: 20 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }.alignItems(HorizontalAlign.Start)
  }

  @Builder
  NavigationMenus() {
    Row() {
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
        .margin({ left: 24 })
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
        .margin({ left: 24 })
    }
  }


  build() {
    Column() {
      Navigation() {
        Button('sublong', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .id('NavNavigationAction800_001')
          .backgroundColor(Color.Pink)
          .width(90)
          .onClick(() => {
            this.index = 5
          })
        Button('sublong2', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .id('NavNavigationAction800_002')
          .backgroundColor(Color.Pink)
          .width(90)
          .onClick(() => {
            this.index = 10
          })
        Button('sublong3', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .id('NavNavigationAction800_003')
          .backgroundColor(Color.Pink)
          .width(90)
          .onClick(() => {
            this.index = 20
          })

        // 步骤2：输入字符更改subtitle长度
        TextInput({ placeholder: '输入字符更改subtitle长度...', text: this.inputText })
          .width('90%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .margin({ top: 8 })
          .id('input_subtitle_800')
          .onChange((value: string) => {
            this.inputText = value
          })

        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('90%')
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
            }
          }, (item: number) => item.toString())
        }
        .height('26.56%')
        .width('100%')
        .margin({ top: 12, left: '10%' })
      }
      .title(this.NavigationTitle)
      .menus(this.NavigationMenus)
      .titleMode(NavigationTitleMode.Full)
      .toolbarConfiguration([
        {
          value: $r('app.string.module_test_desc'),
          icon: $r('app.media.icon')
        },
        {
          value: $r('app.string.module_test_desc'),
          icon: $r('app.media.icon')
        },
        {
          value: $r('app.string.module_test_desc'),
          icon: $r('app.media.icon')
        }
      ])
      .hideTitleBar(false)
      .hideToolBar(false)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
      })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}

