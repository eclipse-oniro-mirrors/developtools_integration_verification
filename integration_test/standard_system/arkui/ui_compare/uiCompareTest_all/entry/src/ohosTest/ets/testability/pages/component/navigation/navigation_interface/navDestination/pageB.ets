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

@Builder
export function pageNavBBuilder(name: string, param: Object) {
  PageNavB()
}

class Param {
  public info: string = '__default_param__';

  constructor(info: string) {
    this.info = info;
  }
}

@Component
export struct PageNavB {
  pathStack: NavPathStack = new NavPathStack();
  private menuItems: NavigationMenuItem[] = [
    {
      value: '1',
      icon: 'resources/base/media/undo.svg',
    },
    {
      value: '2',
      icon: 'resources/base/media/redo.svg',
      isEnabled: false,
    },
    {
      value: '3',
      icon: 'resources/base/media/ic_public_ok.svg',
      isEnabled: true,
    }
  ];

  build() {
    NavDestination() {
      Column() {
        Button('pushPath pageC', { stateEffect: true, type: ButtonType.Capsule })
          .id('pageNavB01')
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            //将name指定的NavDestination页面信息入栈，传递的数据为param
            this.pathStack.pushPath({
              name: 'PageNavC',
              Param: new Param('push PageNavC')
            });
          })
        Button('pushPathByName', { stateEffect: true, type: ButtonType.Capsule })
          .id('pageNavB02')
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pathStack.pushPathByName('PageNavC', null);
          })
      }.width('100%').height('100%')
    }.title('PageNavB')
    .menus(this.menuItems)
    .onBackPressed(() => {
      this.pathStack.pop();
      return true;
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
      console.info('current page config info is ' + JSON.stringify(context.getConfigInRouteMap()));
    })
  }
}