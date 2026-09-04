Name:       basharg
Version:    %{version}
Release:    %(echo `date +%Y%m%d%H%M`)
Summary:    RPM package for %{name}
License:    mit
Requires:   bash
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot

%description
A minimal test framework for bash scripts

%install
rm -rf %{buildroot}
cp -r %{_sourcedir}/* %{buildroot}

%files
/usr/local/bin/basharg

%changelog
* Fri Sep 4 2026 Linus Larsson linus.larsson@bahnhof.se
- First package
