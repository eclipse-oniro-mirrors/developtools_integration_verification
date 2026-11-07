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
@Entry
@Component
struct ProgressLinear04 {


  build() {
    Column() {
      Text('进度条1:')
      Progress({ value: 10, type: ProgressType.Linear })
        .style({strokeWidth:20,strokeRadius:0})
      Text('进度条2:')
      Progress({ value: 10, type: ProgressType.Linear })
        .style({strokeWidth: 20,strokeRadius:5,enableSmoothEffect:true})
      Text('进度条3:')
      Progress({ value: 10, type: ProgressType.Linear })
        .style({strokeWidth: 20,strokeRadius:30,enableSmoothEffect:false})
      Text('进度条4:')
      Progress({ value: 10, type: ProgressType.Linear })
        .style({strokeWidth: 20,strokeRadius:-2})
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}