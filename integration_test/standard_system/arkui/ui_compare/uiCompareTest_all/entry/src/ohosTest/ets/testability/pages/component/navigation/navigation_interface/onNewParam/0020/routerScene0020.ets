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
export function routerScene0020Builder(name: string, param: Object) {
  RouterScene0020()
}

@Component
export struct RouterScene0020 {
  pathStack: NavPathStack = new NavPathStack();
  router: Router = this.getUIContext().getRouter();

  async pushNamedPageOne(mode: router.RouterMode) {
    try {
      await this.router.pushNamedRoute({
        name: 'RouterPageOne0020',
        params: { msg: `pushNamed PageOne ${mode === router.RouterMode.Single ? 'Single' : 'Standard'}` }
      }, mode);
      console.info('router pushNamedRoute pageOne succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router pushNamedRoute pageOne failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  async pushNamedPageTwo(mode: router.RouterMode) {
    try {
      await this.router.pushNamedRoute({
        name: 'RouterPageTwo0020',
        params: { msg: `pushNamed PageTwo ${mode === router.RouterMode.Single ? 'Single' : 'Standard'}` }
      }, mode);
      console.info('router pushNamedRoute pageTwo succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router pushNamedRoute pageTwo failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  build() {
    NavDestination() {
      Column() {
        Text('Router Scene')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('pushNamed pageOne Standard')
          .id('pushNamedPageOneStandardBtn0020')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.pushNamedPageOne(router.RouterMode.Standard);
          });

        Button('pushNamed pageTwo Standard')
          .id('pushNamedPageTwoStandardBtn0020')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.pushNamedPageTwo(router.RouterMode.Standard);
          });

        Button('pushNamed pageOne Single')
          .id('pushNamedPageOneSingleBtn0020')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(async () => {
            await this.pushNamedPageOne(router.RouterMode.Single);
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

