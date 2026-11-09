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
 * CustomControlButtonPage0200
 * 
 * 自定义controlButton页面
 */

@Builder
export function customControlButtonPage0200Builder(name: string, param: Object) {
  CustomControlButtonPage0200()
}

@Component
export struct CustomControlButtonPage0200 {
  @State mainTitle: string = 'NavigationCommonTitle类型-main短标题';
  @State subTitle: string = 'NavigationCommonTitle类型-sub短标题';
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Button('NavigationCommonTitle类型-main超长标题')
          .id('longMainTitleBtn0200')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.mainTitle = 'NavigationCommonTitle类型-main超长标题NavigationCommonTitle类型-main超长标题NavigationCommonTitle类型-main超长标题';
          });

        Button('NavigationCommonTitle类型-sub超长标题')
          .id('longSubTitleBtn0200')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.subTitle = 'NavigationCommonTitle类型-sub超长标题NavigationCommonTitle类型-sub超长标题NavigationCommonTitle类型-sub超长标题';
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title({ main: this.mainTitle, sub: this.subTitle })
    .menus([
      { value: 'Menu1', icon: $r('sys.media.ohos_ic_public_add') },
      { value: 'Menu2', icon: $r('sys.media.ohos_ic_public_add') }
    ])
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

