# Decoded by marshal-magic
# Follow us on telegram @psh_team
from asyncio import sleep
from telethon import events, functions
from jmub import jmub
from sql_helper.globals import addgvar


async def logout_command(event):
    pass
# WARNING: Decompyle incomplete

logout_command = jmub.on(events.NewMessage(
    False, '/out', **('outgoing', 'pattern')))(logout_command)


async def join_channel(event):
    pass
# WARNING: Decompyle incomplete

join_channel = jmub.on(events.NewMessage(
    '/join (.*)', **('pattern',)))(join_channel)
