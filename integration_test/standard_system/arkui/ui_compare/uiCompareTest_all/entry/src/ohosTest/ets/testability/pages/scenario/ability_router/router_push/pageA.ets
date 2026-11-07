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

import './pageB'

@Entry
@Component
struct PageA {
  @State message: string = 'PageA'
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
    Row(){
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('Push PageB')
          .margin({top:30})
          .height(40)
          .id('PageA_Button1')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
          })

        Button('Push and Back')
          .margin({top:30})
          .height(40)
          .id('PageA_Button2')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            Utils.sleep(200)
            this.router.back()
          })

        Button('pushNamedRoute pageB')
          .margin({top:30})
          .height(40)
          .id('PageA_Button3')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB2')
            Utils.sleep(200)
            this.router.back()
          })

        Button('push pageB PushC')
          .margin({top:30})
          .height(40)
          .id('PageA_Button4')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            this.routePush('testability/pages/scenario/ability_router/router_push/pageC')
          })

        Button('push pageB and Back')
          .margin({top:30})
          .height(40)
          .id('PageA_Button5')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            Utils.sleep(300)
            this.router.back()
          })

        Button('push pageA 30 times')
          .margin({top:30})
          .height(40)
          .id('PageA_Button6')
          .onClick(()=>{
            for(let i = 0;i<31;i++){
              this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            }
            Utils.sleep(1000)
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
          })

        Button('push pageB and Push pageA')
          .margin({top:30})
          .height(40)
          .id('PageA_Button7')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            Utils.sleep(600)
            this.routePush('testability/pages/scenario/ability_router/router_push/pageA')
          })

        Button('push pageB and Back')
          .margin({top:30})
          .height(40)
          .id('PageA_Button8')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            Settings.changeWindowOrientation('landScape')
            Utils.sleep(600)
            this.routePush('testability/pages/scenario/ability_router/router_push/pageA')
          })

        Button('push pageB and pageC')
          .margin({top:30})
          .height(40)
          .id('PageA_Button9')
          .onClick(()=>{
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB2')
            Utils.sleep(200)
            this.routePush('testability/pages/scenario/ability_router/router_push/pageC2')
          })
      }.width('50%')

      Column() {

        Button('push page 32 times')
          .margin({top:30})
          .height(40)
          .id('PageA_Button10')
          .onClick(()=>{
            for(let i = 0;i<32;i++){
              this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
            }
          })

        Button('push page 32 times')
          .margin({top:30})
          .height(40)
          .id('PageA_Button11')
          .onClick(async ()=>{
            for(let i = 0;i<29;i++){
              this.routePush('testability/pages/scenario/ability_router/router_push/pageA')
            }
            await Utils.sleep(800)
            this.routePush('testability/pages/scenario/ability_router/router_push/pageB')
          })

        Button('pushNamedRoute pageB')
          .margin({top:30})
          .height(40)
          .id('PageA_Button12')
          .onClick(()=>{
            this.routePage('PageB')
          })

        Button('pushNamedRoute pageB and pageC')
          .margin({top:30})
          .height(40)
          .id('PageA_Button13')
          .onClick(()=>{
            this.routePage('PageB')
            Utils.sleep(200)
            this.routePage('PageC')
          })
      }.width('50%')
    }.height('100%')

  }
}
