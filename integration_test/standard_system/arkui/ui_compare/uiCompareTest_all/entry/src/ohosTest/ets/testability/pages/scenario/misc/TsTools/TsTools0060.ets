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
struct TsTools0060 {
  // 使用@State装饰器装饰变量，用于双向绑定（使用$$语法）
  @State inputValue: string = 'Hello OpenHarmony';
  @State sliderValue: number = 50;
  @State toggleStatus: boolean = false;
  @State checkboxStatus: boolean = true;
  @State textAreaValue: string = 'TextArea Content';
  @State searchValue: string = 'Search Text';
  @State ratingValue: number = 3;

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('@State装饰器双向绑定($$语法)+其他参数')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        // TextInput组件 - 使用$$语法双向绑定text属性，包含其他参数
        Text('TextInput双向绑定($$语法)+其他参数:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        TextInput({ 
          text: $$this.inputValue, 
          placeholder: '请输入文本',
          controller: new TextInputController()
        })
          .width('90%')
          .maxLength(50)
          .type(InputType.Normal)
        Text(`当前值: ${this.inputValue}`)
          .fontSize(14)

        Divider()

        // Slider组件 - 使用$$语法双向绑定value属性，包含其他参数
        Text('Slider双向绑定($$语法)+其他参数:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Slider({
          value: $$this.sliderValue,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet,
          direction: Axis.Horizontal,
          reverse: false
        })
          .width('90%')
          .showSteps(true)
          .showTips(true)
        Text(`当前值: ${this.sliderValue.toFixed(0)}`)
          .fontSize(14)

        Divider()

        // Toggle组件 - 使用$$语法双向绑定isOn属性，包含其他参数
        Text('Toggle双向绑定($$语法)+其他参数:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Toggle({ 
          type: ToggleType.Switch, 
          isOn: $$this.toggleStatus
        })
          .selectedColor(Color.Blue)
          .switchPointColor(Color.White)
        Text(`当前状态: ${this.toggleStatus ? '开启' : '关闭'}`)
          .fontSize(14)

        Divider()

        // Checkbox组件 - 使用$$语法双向绑定select属性，包含其他参数
        Text('Checkbox双向绑定($$语法)+其他参数:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Checkbox({ 
          name: 'checkbox1', 
          group: 'checkboxGroup'
        })
          .select($$this.checkboxStatus)
          .selectedColor(Color.Green)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
        Text(`当前状态: ${this.checkboxStatus ? '选中' : '未选中'}`)
          .fontSize(14)

        Divider()

        // TextArea组件 - 使用$$语法双向绑定text属性，包含其他参数
        Text('TextArea双向绑定($$语法)+其他参数:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        TextArea({ 
          text: $$this.textAreaValue, 
          placeholder: '请输入多行文本',
          controller: new TextAreaController()
        })
          .width('90%')
          .height(80)
          .maxLength(200)
          .showCounter(true)
        Text(`当前值: ${this.textAreaValue}`)
          .fontSize(14)

        Divider()

        // Search组件 - 使用$$语法双向绑定value属性，包含其他参数
        Text('Search双向绑定($$语法)+其他参数:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Search({ 
          value: $$this.searchValue, 
          placeholder: '搜索',
          icon: '/common/search.svg',
          controller: new SearchController()
        })
          .width('90%')
          .searchButton('搜索')
          .maxLength(30)
        Text(`当前值: ${this.searchValue}`)
          .fontSize(14)

        Divider()

        // Rating组件 - 使用$$语法双向绑定rating属性，包含其他参数
        Text('Rating双向绑定($$语法)+其他参数:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Rating({ 
          rating: $$this.ratingValue, 
          indicator: false
        })
          .stars(5)
          .stepSize(0.5)
          .starStyle({
            backgroundUri: '/common/star_background.svg',
            foregroundUri: '/common/star_foreground.svg',
            secondaryUri: '/common/star_secondary.svg'
          })
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

