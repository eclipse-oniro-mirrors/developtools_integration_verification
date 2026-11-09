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
struct TextBackgroundStyle001 {
  controller: RichEditorController = new RichEditorController()
  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .onReady(()=>{
          this.controller.addTextSpan('组件文本观测',{
            style:{
              textBackgroundStyle:{
                color: Color.Red,
                radius:'5vp'
              }
            }
          })
        })
        .align(Alignment.TopStart)
        .height(100)
        .borderWidth(1)
        .width('100%')
    }
  }
}