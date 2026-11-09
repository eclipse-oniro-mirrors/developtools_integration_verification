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
 * NavigationCustomTitlePage0050
 * 
 * 标题内容是NavigationCustomTitle类型的页面（自定义菜单）
 */

@Builder
export function navigationCustomTitlePage0050Builder(name: string, param: Object) {
  NavigationCustomTitlePage0050()
}

@Component
export struct NavigationCustomTitlePage0050 {
  @State titleText: string = 'NavigationCustomTitle类型短标题';
  pathStack: NavPathStack = new NavPathStack();

  @Builder
  CustomTitleBuilder() {
    Text(this.titleText)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor('#182431')
  }

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
      Column() {
        Button('NavigationCustomTitle类型短标题')
          .id('shortTitleBtn0050')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.titleText = 'NavigationCustomTitle类型短标题';
          });

        Button('NavigationCustomTitle类型超长标题')
          .id('longTitleBtn0050')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.titleText = 'NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题';
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title({ builder: this.CustomTitleBuilder, height: 56 })
    .menus(this.CustomMenuBuilder)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

