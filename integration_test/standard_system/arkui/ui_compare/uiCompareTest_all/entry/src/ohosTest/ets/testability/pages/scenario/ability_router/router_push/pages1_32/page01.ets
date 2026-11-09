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

@Entry
@Component
struct Page01 {
  @State message: string = 'Page01';
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

      Button('Back')
        .margin({top:30})
        .height(40)
        .id('Push_Pages')
        .onClick(()=>{
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page02');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page03');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page04');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page05');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page06');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page07');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page08');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page09');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page10');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page11');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page12');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page13');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page14');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page15');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page16');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page17');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page18');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page19');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page20');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page21');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page22');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page23');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page24');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page25');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page26');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page27');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page28');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page29');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page30');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page31');
          this.routePush('testability/pages/scenario/ability_router/router_push/pages1_32/page32');
        })
    }
  }
}
