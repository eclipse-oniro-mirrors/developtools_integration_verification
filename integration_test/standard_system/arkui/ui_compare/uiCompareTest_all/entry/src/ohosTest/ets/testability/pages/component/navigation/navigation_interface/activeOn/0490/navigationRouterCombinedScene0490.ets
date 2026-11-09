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

import { Router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Builder
export function navigationRouterCombinedScene0490Builder(name: string, param: Object) {
  NavigationRouterCombinedScene0490()
}

@Component
export struct NavigationRouterCombinedScene0490 {
  router: Router = this.getUIContext().getRouter();

  async routePushUrl(targetUrl: string) {
    return this.router.pushUrl({
      url: targetUrl
    })
      .then(() => {
        console.info('router pushUrl succeeded');
      })
      .catch((error: BusinessError) => {
        console.error(`router pushUrl failed, code is ${error.code}, message is ${error.message}`);
      });
  }

  build() {
    NavDestination() {
      Column() {
        Text('NavigationRouterCombinedScene')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('router pushUrl routerPageOne')
          .id('routerPushUrlRouterPageOneBtn0490')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.routePushUrl('testability/pages/component/navigation/navigation_interface/activeOn/0490/routerPageOne0490');
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('NavigationRouterCombinedScene')
    .mode(NavDestinationMode.STANDARD)
    .onActive((reason: number) => {
      console.log(`testTag NavigationRouterCombinedScene0490 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag NavigationRouterCombinedScene0490 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
    })
  }
}

