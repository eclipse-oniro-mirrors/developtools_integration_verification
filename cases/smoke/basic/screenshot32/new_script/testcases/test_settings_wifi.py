import logging
import os.path
import time

import pytest

from utils.images import compare_image_similarity, crop_picture


class Test:
    ability_name = 'com.ohos.settings.MainAbility'
    bundle_name = 'com.ohos.settings'

    @pytest.mark.parametrize('setup_teardown', [bundle_name], indirect=True)
    def test(self, setup_teardown, device):
        logging.info('start setting app')
        device.start_ability(self.bundle_name, self.ability_name)

        logging.info('compare image similarity')
        standard_pic = os.path.join(device.resource_path, 'settings.jpeg')
        settings_page_pic = device.save_snapshot_to_local('{}_settings.jpeg'.format(device.sn))
        crop_picture(settings_page_pic)
        similarity = compare_image_similarity(settings_page_pic, standard_pic)
        assert similarity > 0.5, 'compare similarity failed'

        # logging.info('设置界面控件检查')
        # device.refresh_layout()
        # device.assert_text_exist('设置')
        # device.assert_text_exist('WLAN')

        logging.info('enter wlan page')
        # wlan_element = device.get_element_by_text('WLAN')
        # device.click_element(wlan_element)
        device.click(160, 306)
        time.sleep(2)
        device.save_snapshot_to_local('{}_before_click.jpeg'.format(device.sn))
        # device.refresh_layout()
        # wlan_switch = device.get_element_by_type('Toggle')
        before_click = device.get_wifi_status().get('active')

        logging.info('turn on/off wlan swith')
        # device.click_element(wlan_switch)
        device.click(646, 210)
        time.sleep(5)
        device.save_snapshot_to_local('{}_after_click.jpeg'.format(device.sn))
        after_click = device.get_wifi_status().get('active')
        logging.info('wlan switch changes from [{}] to [{}]'.format(before_click, after_click))
        assert before_click != after_click, 'wlan switch turn on/off failed'