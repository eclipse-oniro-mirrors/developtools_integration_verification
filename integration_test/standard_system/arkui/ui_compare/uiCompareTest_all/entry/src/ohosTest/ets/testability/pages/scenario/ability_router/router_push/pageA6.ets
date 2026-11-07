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

import { BusinessError } from '@kit.BasicServicesKit';
import { Router } from '@kit.ArkUI';
import Utils from '../../../../../test/model/Utils.ets';

import ('./pageB6')
import ('./pageC6')

@Entry
@Component
struct PageA6 {
  @State message: string = 'PageA6'
  router: Router = this.getUIContext().getRouter();
  @State scale1: number = 1;
  @State opacity1: number = 1;

  async routePage(targetName:string) {
    this.router.pushNamedRoute({
      name: targetName,
      params: {
        data1: 'message'
      }
    })
      .then(() => {
        console.info('succeeded');
      })
      .catch((error: BusinessError) => {
        console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
      })
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button('Push PageB6 and PageC6')
        .margin({top:30})
        .height(40)
        .id('PageA_Button6_1')
        .onClick(()=>{
          this.routePage('PageB6')
          Utils.sleep(200)
          this.routePage('PageC6')
        })

      Button('Push PageB6 and PageC6')
        .margin({top:30})
        .height(40)
        .id('PageA_Button6_2')
        .onClick(()=>{
          this.routePage('PageB6')
        })
    }
    .width('100%')
    .height('100%')
    .scale({ x: this.scale1 })
    .opacity(this.opacity1)
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}
