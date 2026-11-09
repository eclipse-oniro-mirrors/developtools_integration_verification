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

/**
 * NavigationCommonTitlePage0030
 * 
 * 标题内容是NavigationCommonTitle类型的页面（自定义菜单）
 */

@Builder
export function navigationCommonTitlePage0030Builder(name: string, param: Object) {
  NavigationCommonTitlePage0030()
}

@Component
export struct NavigationCommonTitlePage0030 {
  @State mainTitle: string = 'NavigationCommonTitle类型-main短标题';
  @State subTitle: string = 'NavigationCommonTitle类型-sub短标题';
  pathStack: NavPathStack = new NavPathStack();

  @Builder
  CustomMenuBuilder() {
    Row() {
      Text('Menu1')
        .fontSize(14)
        .margin({ right: 10 })
        .onClick(() => {
          console.info('Menu1 clicked');
        })
      Text('Menu2')
        .fontSize(14)
        .onClick(() => {
          console.info('Menu2 clicked');
        })
    }
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Button('NavigationCommonTitle类型-main超长标题')
            .id('longMainTitleBtn0030')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.mainTitle = 'NavigationCommonTitle类型-main超长标题NavigationCommonTitle类型-main超长标题NavigationCommonTitle类型-main超长标题';
            });

          Button('NavigationCommonTitle类型-sub超长标题')
            .id('longSubTitleBtn0030')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.subTitle = 'NavigationCommonTitle类型-sub超长标题NavigationCommonTitle类型-sub超长标题NavigationCommonTitle类型-sub超长标题';
            });

          Button('NavigationCommonTitle类型-main短标题')
            .id('shortMainTitleBtn0030')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.mainTitle = 'NavigationCommonTitle类型-main短标题';
            });

          Button('NavigationCommonTitle类型-sub短标题')
            .id('shortSubTitleBtn0030')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.subTitle = 'NavigationCommonTitle类型-sub短标题';
            });

          // 添加一些内容以便滚动
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (item: number) => {
            Text(`Content Item ${item}`)
              .fontSize(16)
              .width('100%')
              .height(100)
              .margin({ bottom: 10 })
              .backgroundColor('#E5E5E5')
              .textAlign(TextAlign.Center)
          }, (item: number) => item.toString())
        }
        .width('100%')
        .padding(20)
      }
      .id('scrollView0030')
      .width('100%')
      .height('100%')
    }
    .title({ main: this.mainTitle, sub: this.subTitle })
    .menus(this.CustomMenuBuilder)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

