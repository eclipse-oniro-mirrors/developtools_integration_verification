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
struct UiComponent0803Remaining0040 {
  @State statusText: string = 'idle'
  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_DFX_0040')
        .fontSize(12)
      Video({ src: $r('app.media.icon') })
        .width(200)
        .height(120)
        .controls(true)
        .id('video_host')
        .onPrepared(() => {
          this.statusText = 'video_prepared'
        })
        .onError(() => {
          this.statusText = 'video_error_or_unsupported'
        })
      Text(this.statusText)
        .id('video_status')
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
