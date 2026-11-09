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
import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
class InnerParams {
  data3:number[]

  constructor(tuple:number[]) {
    this.data3 = tuple
  }
}

class RouterParams {
  data1:string
  data2:InnerParams

  constructor(str:string, tuple:number[]) {
    this.data1 = str
    this.data2 = new InnerParams(tuple)
  }
}
@Entry
@Component
struct RouterPage40 {

  build() {
    Column() {
      Button('跳转到详情页（带参数）')
        .onClick(() => {
          // pushUrl保留当前页，参数通过params传递
          router.pushUrl({
            url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface40_copy',
            params: { id: 123, title: 'oh_course' } // 支持对象、数组等复杂参数
          }, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`跳转失败，错误码：${err.code}, 原因：${err.message}`);
            }
          });
        })
        .id('btn')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}