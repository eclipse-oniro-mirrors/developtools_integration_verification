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
 * NavigationOnNewParam0030
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030
 * 测试目的：Router单例跳转支持参数刷新回调OnNewParam(replaceUrl接口测试)
 */

import { RouterScene0030Builder } from './routerScene0030';

@Builder
function dynamicBuilder0030(name: string, param: Object) {
  if (name === 'RouterScene0030') {
    RouterScene0030Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnNewParam0030 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Router单例跳转支持参数刷新回调OnNewParam')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Router组件场景')
          .id('routerSceneBtn0030')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'RouterScene0030', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Router单例跳转支持参数刷新回调OnNewParam')
    .navDestination(dynamicBuilder0030)
  }
}

