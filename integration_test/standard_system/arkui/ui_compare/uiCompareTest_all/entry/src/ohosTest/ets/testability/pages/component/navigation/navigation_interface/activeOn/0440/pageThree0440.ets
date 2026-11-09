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
export function pageThree0440Builder(name: string, param: Object) {
  PageThree0440()
}

@Component
export struct PageThree0440 {
  pathStack: NavPathStack = new NavPathStack();
  router: Router = this.getUIContext().getRouter();

  async routePushNamedRoute(targetName: string) {
    this.router.pushNamedRoute({
      name: targetName,
      params: {}
    })
      .then(() => {
        console.info('router pushNamedRoute succeeded');
      })
      .catch((error: BusinessError) => {
        console.error(`router pushNamedRoute failed, code is ${error.code}, message is ${error.message}`);
      });
  }

  build() {
    NavDestination() {
      Column() {
        Text('PageThree')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('router pushNamedRoute routerPageOne')
          .id('routerPushNamedRouteRouterPageOneBtn0440')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.routePushNamedRoute('RouterPageOne0440');
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E8F5E9')
    }
    .title('PageThree')
    .mode(NavDestinationMode.DIALOG)
    .onActive((reason: number) => {
      console.log(`testTag PageThree0440 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag PageThree0440 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

