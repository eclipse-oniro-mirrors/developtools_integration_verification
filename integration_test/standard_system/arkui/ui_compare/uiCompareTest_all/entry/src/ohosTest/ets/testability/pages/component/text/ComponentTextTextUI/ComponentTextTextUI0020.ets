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
struct ComponentTextTextUI0020 {
  build() {
    Row(){
      Text('ComponentTextTextUI0020')
        .fontSize(16).fontSize(-1).fontSize(0).fontSize(16).fontSize(32).fontSize(91).fontSize(20)
        .fontStyle(FontStyle.Normal).fontStyle(FontStyle.Italic).fontStyle(FontStyle.Normal).fontStyle(FontStyle.Normal).fontStyle(FontStyle.Italic)
        .fontWeight(400).fontWeight(FontWeight.Bold).fontWeight(FontWeight.Bolder).fontWeight(FontWeight.Lighter).fontWeight(FontWeight.Medium).fontWeight(FontWeight.Normal).fontWeight(FontWeight.Bolder)
        .fontColor(Color.Pink).fontColor('0xff0000').fontColor('#ff0000').fontColor('rgba(0,255,0,0.5)').fontColor('rgb(0,0,255)').fontColor('#88888')
    }
    .width('100%')
    .height('100%')
  }
}
