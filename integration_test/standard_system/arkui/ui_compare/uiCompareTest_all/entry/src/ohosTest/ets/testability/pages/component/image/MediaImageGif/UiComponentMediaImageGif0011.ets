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
struct UiComponentMediaImageGif0011 {
  build() {
    Column({ space: 16 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011')
        .fontSize(12)
      List() {
        ListItem() {
          Image($r('app.media.icon')).width(64).height(64).id('image_gif_0011_0')
        }
        ListItem() {
          Image($r('app.media.icon')).width(64).height(64).id('image_gif_0011_1')
        }
        ListItem() {
          Image($r('app.media.icon')).width(64).height(64).id('image_gif_0011_2')
        }
      }
      .height('19.67%')
      .id('image_gif_list_0011')
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
  }
}

