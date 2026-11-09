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

interface PageParam0040 {
  msg?: string;
}

@Entry({ routeName: 'RouterPageOne0040' })
@Component
export struct RouterPageOne0040 {
  @State counter: number = 0;
  private paramMsg: string = '';
  router: Router = this.getUIContext().getRouter();

  onNewParam(param: Object) {
    console.log(`testTag RouterPageOne0040 onNewParam called with param: ${JSON.stringify(param)}`);
    if (param && typeof param === 'object') {
      const pageParam = param as PageParam0040;
      if (pageParam.msg) {
        this.paramMsg = pageParam.msg;
        console.log(`testTag RouterPageOne0040 onNewParam successful, param: ${JSON.stringify(param)}`);
      }
    }
  }

  aboutToAppear() {
    this.counter = 0;
  }

  async backToMain() {
    try {
      await this.router.pushUrl({ url: 'testability/pages/component/navigation/navigation_interface/onNewParam/0040/navigationOnNewParam0040' });
      console.info('router pushUrl to main succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`router pushUrl to main failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  build() {
    Column() {
      Text('RouterPageOne')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Text(`Counter: ${this.counter}`)
        .fontSize(18)
        .margin({ bottom: 10 });

      if (this.paramMsg) {
        Text(`Param: ${this.paramMsg}`)
          .fontSize(16)
          .fontColor('#007DFF')
          .margin({ bottom: 10 });
      }

      Button('back to main')
        .id('backToMainBtn0040')
        .width(200)
        .height(40)
        .margin({ top: 20 })
        .onClick(async () => {
          await this.backToMain();
        });
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

