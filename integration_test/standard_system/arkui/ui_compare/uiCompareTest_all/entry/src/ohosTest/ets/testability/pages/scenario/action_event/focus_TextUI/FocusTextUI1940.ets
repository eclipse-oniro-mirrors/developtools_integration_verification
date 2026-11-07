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
interface styleItem1940 {
  id: string;
  name: string;
  style: FontStyle;
}


@Entry
@Component
struct FocusTextUI1940 {
  @State currentStyle: FontStyle = FontStyle.Italic;
  @State clickCount: number = 0;


  private styleMap: ReadonlyArray<styleItem1940> = [
    { id: 'Bold1940', name: '字体倾斜', style: FontStyle.Italic },
    { id: 'Medium1940', name: '字体正常', style: FontStyle.Normal},
    { id: 'Normal1940', name: '字体倾斜', style: FontStyle.Italic },
  ];

  build() {
    Column() {
      Button(this.getcurrentStyleName())
        .id(this.getcurrentStyleId())  // 设置唯一id
        .fontStyle(this.currentStyle)
        .onClick(() => {
          this.changestyle();
        })
        .width(150)
        .height(50)
        .backgroundColor('#007DFF')
        .borderRadius(25)
        .fontSize(20)

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F7FA')
  }

  // 获取当前权重名称
  getcurrentStyleName(): string {
    return this.styleMap[this.clickCount % 3].name;
  }

  // 获取当前权重id
  getcurrentStyleId(): string {
    return this.styleMap[this.clickCount % 3].id;
  }

  // 切换权重
  changestyle() {
    this.clickCount++;
    this.currentStyle = this.styleMap[this.clickCount % 3].style;

    // 点击三次后重置
    if (this.clickCount >= 3) {
      this.clickCount = 0;
    }
  }
}