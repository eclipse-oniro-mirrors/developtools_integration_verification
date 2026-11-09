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
export struct ComponentNavNavigation0502 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6,7]
  @State currentIndex: number = 0
  @State barStyle: BarStyle = BarStyle.STANDARD
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Full

  // 使用NavigationCommonTitle创建主标题和副标题
  private navigationTitle: NavigationCommonTitle = {
    main: '标题栏设置模糊效果',
    sub: '副标题'
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
    }
  }

  build() {
    Column() {
      Navigation() {
        // 按钮区域
        Column() {
          // 步骤2：点击切换barStyle按钮
          Button(this.barStyle === BarStyle.STANDARD ? 'barStyle:BarStyle.STANDARD' : 'barStyle:BarStyle.STACK')
            .id('button_bar_style_0502')
            .width('90%')
            .height(40)
            .margin({ top: 8, bottom: 8 })
            .onClick(() => {
              if (this.barStyle === BarStyle.STANDARD) {
                this.barStyle = BarStyle.STACK
              } else {
                this.barStyle = BarStyle.STANDARD
              }
            })
        }
        .width('100%')

        // 步骤1：上下滑动内容区
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('列表项 ' + item)
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
        .id('list_content_0502')
        .width('100%')
        .layoutWeight(1)
        .margin({ top: 12 })
        .padding({ left: '5%', right: '5%' })
      }
      .title(this.navigationTitle)
      .menus(this.NavigationMenus)
      .titleMode(this.titleMode)
      .mode(NavigationMode.Stack)
      .hideTitleBar(false)
      .hideToolBar(true)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode changed to: ' + titleModel)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}

