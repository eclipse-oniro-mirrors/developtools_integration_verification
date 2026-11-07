/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiAttributesUseEffectEffectType04 {
  @State isUse: boolean = false;
  build() {
    Stack() {
      Image('/cat.png')
        .autoResize(true)
      EffectComponent() {
        Column({ space: 20 }) {
          Text('Normal text with useEffect is true and set SELECTABLE_FOCUSABLE')
            .textAlign(TextAlign.Center)
            .useEffect(!this.isUse, EffectType.WINDOW_EFFECT)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .textSelectable(TextSelectableMode.SELECTABLE_FOCUSABLE)
            .borderRadius(16)
            .copyOption(CopyOptions.InApp)
            .width('90%')
            .height('48')
        }
        .width('100%')
      }
      .backgroundBlurStyle(BlurStyle.Thin)
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }
}
