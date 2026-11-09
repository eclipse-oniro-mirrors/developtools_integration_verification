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
struct PageB2 {
  @State message: string = 'PageB2'
  router: Router = this.getUIContext().getRouter();

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

      Button('Push PageC')
        .margin({top:30})
        .height(40)
        .id('PageB_Button2_1')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pageC2')
        })

      Button('Back PageA')
        .margin({top:30})
        .height(40)
        .id('PageB_Button2_2')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pageA')
        })

      Button('Back and Push')
        .margin({top:30})
        .height(40)
        .id('PageB_Button2_3')
        .onClick(()=>{
          this.router.back()
          Utils.sleep(200)
          this.routePush('testability/pages/scenario/ability_router/router_push/pageB2')
        })

      Button('Back PageA')
        .margin({top:30})
        .height(40)
        .id('PageB_Button2_4')
        .onClick(()=>{
          this.router.back()
        })


      Button('Back uri PageA')
        .margin({top:30})
        .height(40)
        .id('PageB_Button2_5')
        .onClick(()=>{
          this.router.back({url:'testability/pages/scenario/ability_router/router_push/pageB2'})
        })
    }
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}
