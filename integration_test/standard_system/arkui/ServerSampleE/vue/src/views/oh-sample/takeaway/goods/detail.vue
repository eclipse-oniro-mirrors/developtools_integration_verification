/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
<template>
    <div>
        <Image :src="goodsModel.cover" style="width:100%;" :preview="true" />
        <div class="content">
            <span class="font-18 black">{{ goodsModel.name }}</span>
            <span class="font-12 gray ">销量{{ goodsModel.salesNumber }}</span>
            <div class="font-12"><span class="red">￥</span><span class="font-18 red bold" v-if="goodsModel.salePrice">{{
                goodsModel.salePrice
            }}</span><span v-if="goodsModel.salePrice" class="light-gray del">￥</span><span
                    :class="goodsModel.salePrice ? 'light-gray del' : 'font-18 red bold'">{{ goodsModel.price }}</span>
            </div>
            <a-divider />
            <div class="business">
                <Image :src="businessModel.cover" style="height: 60px;" />
                <div style="margin-left: 8px;">
                    <div class="font-16 black">{{ businessModel.name }}</div>
                    <div style="margin-top: 12px;" class="font-12 black">地址：{{ businessModel.address }}</div>
                </div>
            </div>
            <a-divider />
            <div>
                <div class="font-14 black" style="margin-bottom: 6px;">商品详情</div>
                <div class="font-12"><span class="light-gray " style="margin-right: 12px;">规格</span><span class="black">{{
                    goodsModel.standards }}</span></div>
                <div class="font-12"><span class="light-gray " style="margin-right: 12px;">重量</span><span class="black">{{
                    goodsModel.weight }}</span></div>
                <div class="font-12"><span class="light-gray " style="margin-right: 12px;">商品类别</span><span class="black">{{
                    goodsModel.category }}</span></div>
                <div class="font-12"><span class="light-gray " style="margin-right: 12px;">包装方式</span><span class="black">{{
                    goodsModel.packing }}</span></div>
                <div class="font-12"><span class="light-gray " style="margin-right: 12px;">储存方式</span><span class="black">{{
                    goodsModel.keepType }}</span></div>
            </div>
            <a-divider />
            <div>
                <div style="margin-bottom: 6px;"><span class="font-12 black">价格说明</span>
                    <Icon icon="ant-design:question-circle-outlined" :size="14" />
                </div>
                <div class="font-12 gray">{{ goodsModel.priceExplain }}</div>
            </div>
        </div>
    </div>
</template>
<script lang="ts" name="system-position" setup>
import { Image } from 'ant-design-vue';
import Icon from '/@/components/Icon';
import { useRoute } from 'vue-router';
import { getFileAccessHttpUrl } from '/@/utils/common/compUtils';
import { detail, detailBusiness } from './goods.api';
import { ref } from 'vue';
const route = useRoute();
const goodsId = ref(route.query?.id);
const goodsModel = ref({
  businessId: '',
  cover: '',
  name: '',
  price: '',
  salePrice: '0',
  salesNumber: '0',
  standards: '',
  weight: '',
  packing: '',
  category: '',
  keepType: '',
  priceExplain: ''
});

const businessModel = ref({
  cover: '',
  name: '',
  address: null
});

function getDetail() {
  detail({ id: goodsId.value }).then((data) => {
    data.cover = getFileAccessHttpUrl(data.cover);
    goodsModel.value = data;
    getBusinessDetail(goodsModel.value.businessId);
  });
}

function getBusinessDetail(id) {
  detailBusiness({ id: id }).then((data) => {
    data.cover = getFileAccessHttpUrl(data.cover);
    businessModel.value = data;
  });
}

getDetail();
</script>

<style scoped lang="less">
.content {
    display: flex;
    flex-direction: column;
    padding: 12px;

    .business {
        display: flex;
        flex-direction: row;
    }

    .black {
        color: #333;
    }

    .gray {
        color: #666;
    }

    .light-gray {
        color: #999;
    }

    .red {
        color: red;
    }

    .font-18 {
        font-size: 18px;
    }

    .font-16 {
        font-size: 16px;
    }

    .font-14 {
        font-size: 14px;
    }

    .font-12 {
        font-size: 12px;
    }

    .bold {
        font-weight: bold;
    }

    .del {
        text-decoration-line: line-through;
    }

}
</style>