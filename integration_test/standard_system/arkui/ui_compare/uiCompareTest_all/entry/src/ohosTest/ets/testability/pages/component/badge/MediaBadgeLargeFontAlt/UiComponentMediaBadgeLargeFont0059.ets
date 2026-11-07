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
struct UiComponentMediaBadgeLargeFont0059 {
  build() {
    Column({ space: 16 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0059')
        .fontSize(12)
      Badge({
        count: 8,
        style: { badgeSize: 20, badgeColor: Color.Red }
      }) {
        Text('msg')
          .fontSize(18)
      }
      .id('badge_large_font_0059')
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
  }
}

