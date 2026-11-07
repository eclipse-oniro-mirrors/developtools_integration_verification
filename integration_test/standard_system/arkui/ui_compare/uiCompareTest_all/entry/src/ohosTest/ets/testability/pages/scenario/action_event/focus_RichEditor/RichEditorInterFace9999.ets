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


class BuilderObject {
  public content: string;
  imageUri?: string;
  public type: string;
  id?: string;

  constructor(content: string, type: string, imageUri?: string, id?: string) {
    this.content = content;
    this.imageUri = imageUri;
    this.type = type;
    this.id = id || `builder_${Date.now()}`;
  }
}

@Entry
@Component
struct Index {
  controller: RichEditorController = new RichEditorController();
  option: RichEditorOptions = { controller: this.controller };
  @State builderId: number = 0;

  // 保留核心Builder定义
  @Builder
  chipBuilder(builder: BuilderObject) {
    Row() {
      Text(builder.content)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)

      SymbolGlyph($r('app.media.Symbolspan001'))
        .width(16)
        .height(16)
    }
    .height('100%')
    .backgroundColor('#E0E0E0')
    .borderRadius(14)
    .padding(8)
  }

  build() {
    Column() {
      // 简化UI布局
      RichEditor(this.option)
        .width('100%')
        .height(180)
        .onReady(() => {
          this.controller.addTextSpan('点击下方按钮添加BuilderSpan');
        })
        .border({ width: 1, color: '#DDD' })

      // 仅保留添加BuilderSpan的按钮
      Button('添加ChipBuilder')
        .id('InterFace9999')
        .onClick(() => this.addBuilderSpan())
        .width('80%')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  // 核心添加逻辑
  private addBuilderSpan() {
    const builder = new BuilderObject(
      '测试BuilderSpan ' + this.builderId,
      'chipBuilder'
    );

    this.controller.addBuilderSpan(() => {
      this.chipBuilder(builder);
    }, {
      offset: this.controller.getCaretOffset()
    });

    this.builderId++;
    console.info('BuilderSpan添加成功，ID:', builder.id);
  }
}

export {}
