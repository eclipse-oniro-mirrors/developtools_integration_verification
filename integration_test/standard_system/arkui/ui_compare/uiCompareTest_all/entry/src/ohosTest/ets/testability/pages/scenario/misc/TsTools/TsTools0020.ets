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
struct TsTools0020 {
  // 使用@State装饰器装饰变量，用于双向绑定（使用$语法）
  @State inputValue: string = 'Hello OpenHarmony';
  @State sliderValue: number = 50;
  @State toggleStatus: boolean = false;
  @State checkboxStatus: boolean = true;
  @State radioStatus: string = 'Radio1';
  @State textAreaValue: string = 'TextArea Content';
  @State searchValue: string = 'Search Text';
  @State ratingValue: number = 3;

  build() {
    Scroll() {
      Column({ space: 20 }) {
        // TextInput组件 - 使用$$语法进行双向绑定
        Text('TextInput双向绑定($$语法):')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        TextInput({ text: $$this.inputValue, placeholder: '请输入文本' })
          .width('90%')
        Text(`当前值: ${this.inputValue}`)
          .fontSize(14)

        Divider()

        // Slider组件 - 使用$$语法进行双向绑定
        Text('Slider双向绑定($$语法):')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Slider({
          value: $$this.sliderValue,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet
        })
          .width('90%')
        Text(`当前值: ${this.sliderValue.toFixed(0)}`)
          .fontSize(14)

        Divider()

        // Toggle组件 - 使用$$语法进行双向绑定
        Text('Toggle双向绑定($$语法):')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Toggle({ type: ToggleType.Switch, isOn: $$this.toggleStatus })
        Text(`当前状态: ${this.toggleStatus ? '开启' : '关闭'}`)
          .fontSize(14)

        Divider()

        // Checkbox组件 - 使用$$语法进行双向绑定
        Text('Checkbox双向绑定($$语法):')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .select($$this.checkboxStatus)
        Text(`当前状态: ${this.checkboxStatus ? '选中' : '未选中'}`)
          .fontSize(14)

        Divider()

        // TextArea组件 - 使用$$语法进行双向绑定
        Text('TextArea双向绑定($$语法):')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        TextArea({ text: $$this.textAreaValue, placeholder: '请输入多行文本' })
          .width('90%')
          .height(80)
        Text(`当前值: ${this.textAreaValue}`)
          .fontSize(14)

        Divider()

        // Search组件 - 使用$$语法进行双向绑定
        Text('Search双向绑定($$语法):')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Search({ value: $$this.searchValue, placeholder: '搜索' })
          .width('90%')
        Text(`当前值: ${this.searchValue}`)
          .fontSize(14)

        Divider()

        // Rating组件 - 使用$$语法进行双向绑定
        Text('Rating双向绑定($$语法):')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Rating({ rating: $$this.ratingValue, indicator: false })
        Text(`当前评分: ${this.ratingValue}`)
          .fontSize(14)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }
}

