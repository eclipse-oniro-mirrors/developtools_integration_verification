/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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

@Entry({ routeName: 'PageC' })
@Component
struct PageC {
  @State message: string = 'PageC';
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
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('Push PageB')
          .margin({top:30})
          .height(40)
          .id('PageC_Button1')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
          })

        Button('Back Back')
          .margin({top:30})
          .height(40)
          .id('PageC_Button2')
          .onClick(()=>{
            this.router.back()
            this.router.back()
          })

        Button('Push PageB and Push PageA')
          .margin({top:30})
          .height(40)
          .id('PageC_Button3')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            Utils.sleep(800)
            this.routePush('testability/pages/scenario/ability_router/router_push/pageA')
          })

        Button('Back and push')
          .margin({top:30})
          .height(40)
          .id('PageC_Button4')
          .onClick(()=>{
            this.router.back()
            Utils.sleep(500)
            this.routePush('testability/pages/scenario/ability_router/router_push/pageA')
          })

        Button('Back url pageB')
          .margin({top:30})
          .height(40)
          .id('PageC_Button5')
          .onClick(()=>{
            this.router.back({url:'testability/pages/scenario/ability_router/router_push/pageB'})
          })

        Button('Back url and Back')
          .margin({top:30})
          .height(40)
          .id('PageC_Button6')
          .onClick(()=>{
            this.router.back({url:'testability/pages/scenario/ability_router/router_push/pageB'})
            Utils.sleep(500)
            this.router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}