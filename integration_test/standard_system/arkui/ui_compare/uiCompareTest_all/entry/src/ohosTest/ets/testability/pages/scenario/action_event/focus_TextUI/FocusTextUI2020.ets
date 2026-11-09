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
interface WeightItem2020 {
  id: string;
  name: string;
  weight: FontWeight;
}


@Entry
@Component
struct FocusTextUI2020 {
  @State currentWeight: FontWeight = FontWeight.Normal;
  @State clickCount: number = 0;


  private weightMap: ReadonlyArray<WeightItem2020> = [
    { id: 'Normal2020', name: '字体正常', weight: FontWeight.Normal },
    { id: 'Bold2020', name: '字体加粗', weight: FontWeight.Bold },
  { id: 'Medium2020', name: '字体适中', weight: FontWeight.Medium }
  ];

  build() {
    Column() {
      Button(this.getCurrentWeightName())
        .id(this.getCurrentWeightId())  // 设置唯一id
        .fontWeight(this.currentWeight)
        .onClick(() => {
          this.changeWeight();
        })
        .width(150)
        .height(50)
        .backgroundColor('#007DFF')
        .borderRadius(25)
        .fontSize(16)

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F7FA')
  }

  // 获取当前权重名称
  getCurrentWeightName(): string {
    return this.weightMap[this.clickCount % 3].name;
  }

  // 获取当前权重id
  getCurrentWeightId(): string {
    return this.weightMap[this.clickCount % 3].id;
  }

  // 切换权重
  changeWeight() {
    this.clickCount++;
    this.currentWeight = this.weightMap[this.clickCount % 3].weight;

    // 点击三次后重置
    if (this.clickCount >= 3) {
      this.clickCount = 0;
    }
  }
}