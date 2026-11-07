/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct UiComponentMediaDcStress0035 {
  build() {
    Column({ space: 16 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_DC_0035')
        .fontSize(12)
      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Progress({ value: 50, total: 100 }).width(60).id('dc_p1_0035')
          Progress({ value: 80, total: 100 }).width(60).id('dc_p2_0035')
        }
        Row({ space: 8 }) {
          LoadingProgress().width(36).height(36).id('dc_l1_0035')
          LoadingProgress().width(36).height(36).id('dc_l2_0035')
        }
      }
      .id('dc_stress_0035')
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
  }
}

