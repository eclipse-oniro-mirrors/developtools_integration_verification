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
struct UiComponentMediaProgressAnimateto0010 {
  @State progressValue: number = 10
  build() {
    Column({ space: 16 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_ANIMATETO_0010')
        .fontSize(12)
      Progress({ value: this.progressValue, total: 100 })
        .width('80%')
        .style({ enableSmoothEffect: false })
        .id('progress_animateto_0010')
      Button('run')
        .id('progress_animateto_0010_btn')
        .onClick(() => {
          this.getUIContext().animateTo({ duration: 800 }, () => {
            this.progressValue = 80
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
  }
}

