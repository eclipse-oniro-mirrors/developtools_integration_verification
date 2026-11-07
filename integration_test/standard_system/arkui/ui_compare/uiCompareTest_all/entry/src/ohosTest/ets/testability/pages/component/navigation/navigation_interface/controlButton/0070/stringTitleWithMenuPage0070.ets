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
 * StringTitleWithMenuPage0070
 * 
 * 标题内容是string类型，携带菜单按钮的页面
 */

@Builder
export function stringTitleWithMenuPage0070Builder(name: string, param: Object) {
  StringTitleWithMenuPage0070()
}

@Component
export struct StringTitleWithMenuPage0070 {
  @State mainTitle: string = '我是主标题';
  @State useCustomMenu: boolean = false; // false表示非自定义菜单，true表示自定义菜单
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
          TextInput({ placeholder: 'mainTitle' })
            .id('mainTitleInput0070')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onChange((value: string) => {
              this.mainTitle = value;
            });

          Button('自定义菜单按钮')
            .id('customMenuBtn0070')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.useCustomMenu = true;
            });

          Button('非自定义菜单按钮')
            .id('nonCustomMenuBtn0070')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.useCustomMenu = false;
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
      .id('scrollView0070')
      .width('100%')
      .height('100%')
    }
    .title(this.mainTitle)
    .menus(this.useCustomMenu ? this.CustomMenuBuilder : [
      { value: 'Menu1', icon: $r('sys.media.ohos_ic_public_add') },
      { value: 'Menu2', icon: $r('sys.media.ohos_ic_public_add') }
    ])
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

