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
 * ResourceTitlePage0010
 * 
 * 标题内容是resource类型的页面
 */

@Builder
export function resourceTitlePage0010Builder(name: string, param: Object) {
  ResourceTitlePage0010()
}

@Component
export struct ResourceTitlePage0010 {
  @State titleResource: ResourceStr = $r('app.string.resource_title_short'); // 短标题
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Button('resource类型短标题')
            .id('shortTitleBtn0010')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.titleResource = $r('app.string.resource_title_short');
            });

          Button('resource类型超长标题')
            .id('longTitleBtn0010')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              // 使用一个很长的resource字符串
              this.titleResource = $r('app.string.resource_title_long');
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
      .id('scrollView0010')
      .width('100%')
      .height('100%')
    }
    .title(this.titleResource)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

