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

@Entry
@Component
struct Page17 {
  @State message: string = 'Page17';
  router: Router = this.getUIContext().getRouter();

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button('Back')
        .margin({top:30})
        .height(40)
        .id('Page17_Back')
        .onClick(()=>{
          this.router.back({url:'testability/pages/scenario/ability_router/router_push/pages1_32/page16'})
        })
    }
  }
}
