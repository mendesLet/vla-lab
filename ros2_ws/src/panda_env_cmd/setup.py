from setuptools import setup


package_name = "panda_env_cmd"


setup(
name=package_name,
version="0.1.0",
packages=[package_name],
data_files=[
("share/ament_index/resource_index/packages", [f"resource/{package_name}"]),
(f"share/{package_name}", ["package.xml"]),
(f"share/{package_name}/launch", ["launch/panda_with_cmd.launch.py"]),
],
install_requires=["setuptools"],
zip_safe=True,
maintainer="You",
maintainer_email="you@example.com",
description="Generic command server (rclpy) for Panda environment + Ignition launch.",
license="Apache-2.0",
tests_require=["pytest"],
entry_points={
"console_scripts": [
"command_server = panda_env_cmd.command_server:main",
],
},
)