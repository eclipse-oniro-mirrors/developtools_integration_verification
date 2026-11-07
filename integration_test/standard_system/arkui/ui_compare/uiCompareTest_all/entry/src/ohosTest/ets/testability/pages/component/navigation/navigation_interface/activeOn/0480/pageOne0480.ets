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
export function pageOne0480Builder(name: string, param: Object) {
  PageOne0480()
}

@Component
export struct PageOne0480 {
  pathStack: NavPathStack = new NavPathStack();
  router: Router = this.getUIContext().getRouter();

  async routePushUrl(targetUrl: string) {
    this.router.pushUrl({
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
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('router pushUrl routerPageOne')
          .id('routerPushUrlRouterPageOneBtn0480')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.routePushUrl('testability/pages/component/navigation/navigation_interface/activeOn/0480/routerPageOne0480');
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F5F5F5')
    }
    .title('PageOne')
    .mode(NavDestinationMode.STANDARD)
    .onActive((reason: number) => {
      console.log(`testTag PageOne0480 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag PageOne0480 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

