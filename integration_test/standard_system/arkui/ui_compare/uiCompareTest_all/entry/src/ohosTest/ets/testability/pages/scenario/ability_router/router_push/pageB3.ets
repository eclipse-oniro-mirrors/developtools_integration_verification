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
import Settings from '../../../../../test/model/Settings.ets';
import ('./pageC3')

@Entry({ routeName: 'PageB3' })
@Component
struct PageB3 {
  @State message: string = 'PageB3'
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

      Button('Back')
        .margin({top:30})
        .height(40)
        .id('PageB_Button3_1')
        .onClick(()=>{
          this.router.back()
        })

      Button('Push PageC3')
        .margin({top:30})
        .height(40)
        .id('PageB_Button3_2')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pageC3')
        })

      Button('Push PageC3')
        .margin({top:30})
        .height(40)
        .id('PageB_Button3_3')
        .onClick(()=>{
          this.routePage('PageC3')
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
