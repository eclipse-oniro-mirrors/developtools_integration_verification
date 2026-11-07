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

import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';

@Builder
function buildSlider(config: SliderConfiguration) {
  Row() {
    Column({ space: 30 }) {
      Button('增加')
        .onClick(() => {
          config.value = config.value + config.step;
          config.triggerChange(config.value, SliderChangeMode.Click);
        })
        .id('UiComponentFormInteractionFrameNode92_01')
        .width(100)
        .height(10)
        .fontSize(5)
        .enabled(config.value < config.max)

      Button('减少')
        .onClick(() => {
          config.value = config.value - config.step;
          config.triggerChange(config.value, SliderChangeMode.Click);
        })
        .width(100)
        .id('UiComponentFormInteractionFrameNode92_02')
        .height(10)
        .fontSize(5)
        .enabled(config.value > config.min)

      Slider({
        value: config.value,
        min: config.min,
        max: config.max,
        step: config.step,
      })
        .width(config.max)
        .visibility((config.contentModifier as MySliderStyle).showSlider ? Visibility.Visible : Visibility.Hidden)
        .showSteps(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          config.triggerChange(value, mode);
        })
      Text('进度值：' + config.value)
        .fontSize(10)
    }
  }
  .width('100%')
}

class MySliderStyle implements ContentModifier<SliderConfiguration> {
  public showSlider: boolean = true;
  public sliderChangeMode: number = 0;

  constructor(showSlider: boolean, sliderChangeMode: number) {
    this.showSlider = showSlider;
    this.sliderChangeMode = sliderChangeMode;
  }

  applyContent(): WrappedBuilder<[SliderConfiguration]> {
    return wrapBuilder(buildSlider);
  }
}

@Builder
function buildSlider2(config: SliderConfiguration) {
  Row() {
    Column({ space: 30 }) {
      Button('增加')
        .onClick(() => {
          config.value = config.value + config.step;
          config.triggerChange(config.value, SliderChangeMode.Click);
        })
        .id('UiComponentFormInteractionFrameNode92_03')
        .width(100)
        .height(10)
        .fontSize(5)
        .enabled(config.value < config.max)

      Button('减少')
        .onClick(() => {
          config.value = config.value - config.step;
          config.triggerChange(config.value, SliderChangeMode.Click);
        })
        .id('UiComponentFormInteractionFrameNode92_04')
        .width(100)
        .height(10)
        .fontSize(5)
        .enabled(config.value > config.min)

      Slider({
        value: config.value,
        min: config.min,
        max: config.max,
        step: config.step,
      })
        .width(config.max)
        .visibility((config.contentModifier as MySliderStyle).showSlider ? Visibility.Visible : Visibility.Hidden)
        .showSteps(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          config.triggerChange(value, mode);
        })
      Text('进度值：' + config.value)
        .fontSize(10)
    }
  }
  .width('100%')
}

class MySliderStyle2 implements ContentModifier<SliderConfiguration> {
  public showSlider: boolean = true;
  public sliderChangeMode: number = 0;

  constructor(showSlider: boolean, sliderChangeMode: number) {
    this.showSlider = showSlider;
    this.sliderChangeMode = sliderChangeMode;
  }

  applyContent(): WrappedBuilder<[SliderConfiguration]> {
    return wrapBuilder(buildSlider2);
  }
}

class MyNodeController extends NodeController {

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width('100%')
      .height('30%')
      .borderColor(Color.Gray)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 0 })
      .width('100%')
      .height('100%')
    node.appendChild(col);
    let text = typeNode.createNode(uiContext, 'Slider');
    text.initialize({
      value: 10,
      direction: Axis.Vertical,
      step:20,
      min: 0,
      max: 100,
      style: SliderStyle.OutSet
    })
      .contentModifier(new MySliderStyle2(true, 0))
      .showTips(true)
      .trackColor('#ADd7E6')
      .showSteps(true)
      .stepSize(8)
      .stepColor(Color.Yellow)
      .blockSize({width: 18, height: 18})
      .selectedColor('#4169E1')
      .onChange((value: number, mode: SliderChangeMode) => {
        console.info('onchange success');
      })
    col.appendChild(text);
    return node;
  }
}

@Entry
@Component
struct UiComponentFormInteractionFrameNode92 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string = 'FrameNode create'
  @State text2 :string = 'ArkTs create'
  @State text3 :string = 'Slider set SliderOptions to true'
  @State outSetValueOne: number = 10;

  build() {
    Column(){
      Column() {
        Text(this.text)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .maxLines(2)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
        NodeContainer(this.myNodeController);
      }
      Column(){
        Text(this.text2)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .maxLines(2)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
        Slider({
          value: this.outSetValueOne,
          step:20,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .contentModifier(new MySliderStyle(true, 0))
          .showTips(true)
          .trackColor('#ADd7E6')
          .showSteps(true)
          .stepSize(8)
          .stepColor(Color.Yellow)
          .selectedColor('#4169E1')
          .blockSize({width: 18, height: 18})
          .onChange((value: number, mode: SliderChangeMode) => {
            console.info('onchange success');
          })
      }
    }
    .width('100%')
  }
}
