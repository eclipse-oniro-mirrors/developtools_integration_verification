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
struct UiComponentInformationProgressInterface0130 {
  build() {
    Column({ space: 16 }) {
      Text('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0130')
        .fontSize(12)
      Progress({ value: 50, total: 100, type: ProgressType.Ring })
        .style({ strokeWidth: 10, enableScanEffect: true, shadow: true })
        .width(120)
        .height(120)
        .color(0xFF0000)
        .id('progress_interface_0130')
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
  }
}

