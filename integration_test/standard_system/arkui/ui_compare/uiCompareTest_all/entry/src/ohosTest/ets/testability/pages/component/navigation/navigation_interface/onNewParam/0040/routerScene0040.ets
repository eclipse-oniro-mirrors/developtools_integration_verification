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

import { router, Router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Builder
export function routerScene0040Builder(name: string, param: Object) {
  RouterScene0040()
}

@Component
export struct RouterScene0040 {
  pathStack: NavPathStack = new NavPathStack();
  router: Router = this.getUIContext().getRouter();

  async pushUrlPageOne(mode: router.RouterMode) {
    try {
      await this.router.pushUrl({
        url: 'testability/pages/component/navigation/navigation_interface/onNewParam/0040/routerPageOne0040',
        params: { msg: `pushUrl One ${mode === router.RouterMode.Single ? 'Single' : 'Standard'}` }
      }, mode);
      console.info('router pushUrl pageOne succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router pushUrl pageOne failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  async pushUrlPageTwo(mode: router.RouterMode) {
    try {
      await this.router.pushUrl({
        url: 'testability/pages/component/navigation/navigation_interface/onNewParam/0040/routerPageTwo0040',
        params: { msg: `pushUrl Two ${mode === router.RouterMode.Single ? 'Single' : 'Standard'}` }
      }, mode);
      console.info('router pushUrl pageTwo succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router pushUrl pageTwo failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  async pushUrlPageThree(mode: router.RouterMode) {
    try {
      await this.router.pushUrl({
        url: 'testability/pages/component/navigation/navigation_interface/onNewParam/0040/routerPageThree0040',
        params: { msg: `pushUrl Three ${mode === router.RouterMode.Single ? 'Single' : 'Standard'}` }
      }, mode);
      console.info('router pushUrl pageThree succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router pushUrl pageThree failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  async replaceNamedPageOne(mode: router.RouterMode) {
    try {
      await this.router.replaceNamedRoute({
        name: 'RouterPageOne0040',
        params: { msg: `replaceNamed PageOne ${mode === router.RouterMode.Single ? 'Single' : 'Standard'}` }
      }, mode);
      console.info('router replaceNamedRoute pageOne succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router replaceNamedRoute pageOne failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  async replaceNamedPageTwo(mode: router.RouterMode) {
    try {
      await this.router.replaceNamedRoute({
        name: 'RouterPageTwo0040',
        params: { msg: `replaceNamed PageTwo ${mode === router.RouterMode.Single ? 'Single' : 'Standard'}` }
      }, mode);
      console.info('router replaceNamedRoute pageTwo succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router replaceNamedRoute pageTwo failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  build() {
    NavDestination() {
      Column() {
        Text('Router Scene')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('pushUrl pageOne Standard')
          .id('pushUrlPageOneStandardBtn0040')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.pushUrlPageOne(router.RouterMode.Standard);
          });

        Button('pushUrl pageTwo Standard')
          .id('pushUrlPageTwoStandardBtn0040')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.pushUrlPageTwo(router.RouterMode.Standard);
          });

        Button('pushUrl pageThree Standard')
          .id('pushUrlPageThreeStandardBtn0040')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.pushUrlPageThree(router.RouterMode.Standard);
          });

        Button('replaceNamed pageOne Standard')
          .id('replaceNamedPageOneStandardBtn0040')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.replaceNamedPageOne(router.RouterMode.Standard);
          });

        Button('replaceNamed pageTwo Single')
          .id('replaceNamedPageTwoSingleBtn0040')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.replaceNamedPageTwo(router.RouterMode.Single);
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E3F2FD')
    }
    .title('Router Scene')
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

