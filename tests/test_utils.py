from mysite.utils import format_name

def test_format_name():
    assert format_name('mahmoodur') == 'Mahmoodur'
