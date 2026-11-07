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
struct TextRicheditorSearch01 {
  // 创建控制器
  controller: RichEditorController = new RichEditorController();

  // 配置初始化选项
  options: RichEditorOptions = {
    controller: this.controller  // 必填参数，绑定控制器
  };

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          // 组件就绪后添加默认文本
          this.controller.addTextSpan('初始文本', {
            style: { fontColor: Color.Black, fontSize: 15 }
          });
          this.controller.addImageSpan($r('app.media.icon'), {
            imageStyle: {
              size: ['80px', '80px']
            }
          });
        })
        .id('TextRicheditorSearch01')
        .onClick(()=>{

        })
    }
  }
}
