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

@Entry
@Component
struct PageA4 {
  @State message: string = 'PageA4'
  router: Router = this.getUIContext().getRouter();
  @State scale1: number = 1;
  @State opacity1: number = 1;

  async routePush(targetUrl:string) {
    this.router.pushUrl({
      url: targetUrl
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

      Button('Push PageB4')
        .margin({top:30})
        .height(40)
        .id('PageA_Button4_1')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pageB4')
        })

      Button('Push PageB4 and PageC4')
        .margin({top:30})
        .height(40)
        .id('PageA_Button4_2')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pageB4')
        })

      Button('Push PageB4 and Back')
        .margin({top:30})
        .height(40)
        .id('PageA_Button4_3')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pageB4')
          Utils.sleep(200)
          this.router.back()
        })

      Button('Push PageB4 and PageC4')
        .margin({top:30})
        .height(40)
        .id('PageA_Button4_4')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pageB4')
          Utils.sleep(200)
          this.routePush('testability/pages/scenario/ability_router/router_push/pageC4')
        })
    }
    .width('100%')
    .height('100%')
    .scale({ x: this.scale1 })
    .opacity(this.opacity1)
  }

  pageTransition() {
    PageTransitionEnter({ duration: 600, curve: Curve.Linear })
      .onEnter((type: RouteType, progress: number) => {
        if (type == RouteType.Push||type == RouteType.Pop) {
          this.scale1 = progress
          this.opacity1 = progress
        }
      })
    PageTransitionExit({ duration: 600, curve: Curve.Ease })
      .onExit((type: RouteType, progress: number) => {
        if (type == RouteType.Push) {
          this.scale1 = 1 - progress
          this.opacity1 = 1 - progress
        }
      })
  }
}
